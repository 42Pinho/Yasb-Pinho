<#
===============================================================================
 publicar.ps1 — Publica a sua barra YASB neste repositório
===============================================================================

 PARA QUEM É ESTE SCRIPT?
   Para o autor do repositório (ou para quem fizer um fork e quiser manter o
   próprio repo atualizado). Se você só quer USAR a barra, ignore esta pasta e
   siga o README.md.

 O QUE ELE FAZ
   1. Copia config.yaml e styles.css da sua pasta do YASB para o repositório.
   2. Troca valores pessoais por valores genéricos (ex.: nome do seu monitor
      vira '*', que significa "todas as telas"). A lista fica em $Substituicoes.
   3. TRAVA DE SEGURANÇA: lê o seu .env e cancela tudo se algum valor dele
      (chave de API, senha, caminho pessoal) aparecer nos arquivos copiados.
   4. Avisa se o config.yaml usa alguma variável $env:NOME que não está
      documentada no .env.example.
   5. Mostra o que mudou. Se você passar -Mensagem, também faz commit e push.

 COMO USAR (no PowerShell, dentro da pasta do repositório)
   .\ferramentas\publicar.ps1                         # só copia e mostra o diff
   .\ferramentas\publicar.ps1 -Mensagem "Novo widget" # copia, commita e envia

 Se o Windows bloquear a execução de scripts, rode antes (só nesta janela):
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
===============================================================================
#>

param(
    # Pasta onde fica a sua barra em uso (padrão do YASB).
    [string]$Origem = (Join-Path $env:USERPROFILE ".config\yasb"),

    # Mensagem do commit. Se vazia, o script NÃO faz commit nem push.
    [string]$Mensagem = ""
)

$ErrorActionPreference = "Stop"
$Repo = Split-Path -Parent $PSScriptRoot          # pasta raiz do repositório
$Utf8SemBom = New-Object System.Text.UTF8Encoding $false

# -----------------------------------------------------------------------------
# Substituições "pessoal -> genérico" aplicadas no config.yaml publicado.
# Para adicionar uma nova, copie uma linha e ajuste De/Para.
# -----------------------------------------------------------------------------
$Substituicoes = @(
    @{ De = "screens: ['Acer KG241']"; Para = "screens: ['*']"; Motivo = "monitor do autor -> todas as telas" }
    # @{ De = 'location: "Joinville"'; Para = 'location: "Sao Paulo"'; Motivo = "cidade do clima" }
)

# Variáveis que já existem em todo Windows (não precisam estar no .env.example).
$VariaveisDoWindows = @("APPDATA", "LOCALAPPDATA", "TEMP", "TMP", "USERPROFILE",
                        "PROGRAMFILES", "PROGRAMDATA", "SYSTEMROOT", "WINDIR", "USERNAME")

function Passo($texto) { Write-Host "`n==> $texto" -ForegroundColor Cyan }
function Falha($texto) { Write-Host "`nERRO: $texto" -ForegroundColor Red; exit 1 }

# --- 1. Copiar os arquivos ---------------------------------------------------
Passo "Copiando arquivos de $Origem"
foreach ($arquivo in @("config.yaml", "styles.css")) {
    $caminho = Join-Path $Origem $arquivo
    if (-not (Test-Path $caminho)) { Falha "Não encontrei $caminho" }
}
$config = [System.IO.File]::ReadAllText((Join-Path $Origem "config.yaml"), [System.Text.Encoding]::UTF8)
$estilos = [System.IO.File]::ReadAllText((Join-Path $Origem "styles.css"), [System.Text.Encoding]::UTF8)

# --- 2. Deixar genérico -------------------------------------------------------
Passo "Aplicando substituições pessoais -> genéricas"
foreach ($s in $Substituicoes) {
    if ($config.Contains($s.De)) {
        $config = $config.Replace($s.De, $s.Para)
        Write-Host "  ok  $($s.Motivo)"
    } elseif ($config.Contains($s.Para)) {
        Write-Host "  --  já está genérico: $($s.Motivo)"
    } else {
        Write-Host "  !!  não encontrei '$($s.De)' — confira se a linha mudou" -ForegroundColor Yellow
    }
}

# --- 3. Trava de segurança contra vazamento ----------------------------------
Passo "Verificando se algum valor do seu .env vazaria"
$envLocal = Join-Path $Origem ".env"
if (Test-Path $envLocal) {
    $vazamentos = @()
    foreach ($linha in [System.IO.File]::ReadAllLines($envLocal, [System.Text.Encoding]::UTF8)) {
        $linha = $linha.Trim()
        if ($linha -eq "" -or $linha.StartsWith("#") -or -not $linha.Contains("=")) { continue }
        $nome, $valor = $linha.Split("=", 2)
        $valor = $valor.Trim()
        if ($valor.Length -ge 6 -and ($config.Contains($valor) -or $estilos.Contains($valor))) {
            $vazamentos += $nome.Trim()
        }
    }
    if ($vazamentos.Count -gt 0) {
        Falha "o valor de $($vazamentos -join ', ') (do seu .env) aparece nos arquivos. Nada foi publicado."
    }
    Write-Host "  ok  nenhum valor do .env encontrado nos arquivos"
} else {
    Write-Host "  --  sem .env na origem, verificação pulada"
}

# --- 4. Variáveis $env: documentadas? ----------------------------------------
Passo "Conferindo variáveis `$env: usadas no config.yaml"
$exemplo = Join-Path $Repo ".env.example"
$textoExemplo = if (Test-Path $exemplo) { [System.IO.File]::ReadAllText($exemplo, [System.Text.Encoding]::UTF8) } else { "" }
# Só conta $env: que aparece antes de qualquer "#" na linha (ignora comentários).
$usadas = [regex]::Matches($config, '(?m)^[^#\r\n]*\$env:([A-Za-z_][A-Za-z0-9_]*)') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
foreach ($v in $usadas) {
    if ($VariaveisDoWindows -contains $v.ToUpper()) { continue }
    if ($textoExemplo -notmatch "(?m)^#?\s*$([regex]::Escape($v))=") {
        Write-Host "  !!  $v é usada no config.yaml mas não está no .env.example" -ForegroundColor Yellow
    }
}

# --- Gravar no repositório ----------------------------------------------------
[System.IO.File]::WriteAllText((Join-Path $Repo "config.yaml"), $config, $Utf8SemBom)
[System.IO.File]::WriteAllText((Join-Path $Repo "styles.css"), $estilos, $Utf8SemBom)

# --- 5. Mostrar mudanças / commit --------------------------------------------
Passo "Mudanças no repositório"
git -C $Repo status --short
git -C $Repo diff --stat

if ($Mensagem -ne "") {
    Passo "Commit e push"
    git -C $Repo add config.yaml styles.css
    git -C $Repo commit -m $Mensagem
    git -C $Repo push
} else {
    Write-Host "`nNada foi commitado. Revise com 'git diff' e rode de novo com -Mensagem `"...`" para publicar." -ForegroundColor Green
}
