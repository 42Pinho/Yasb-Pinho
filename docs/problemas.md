# Solução de problemas

## Primeiro passo: olhe o log

O YASB anota tudo o que acontece no arquivo **`yasb.log`**, na pasta `%USERPROFILE%\.config\yasb`.

1. Abra o arquivo com o Bloco de Notas.
2. Vá até o **final** (Ctrl+End): as linhas mais recentes ficam lá.
3. Procure por **`[ERROR]`** ou **`[WARNING]`**. Elas dizem o que está errado.

Depois de corrigir, rode no PowerShell:

```powershell
yasbc reload
```

---

## O clima não aparece

O log mostra `API key or location is missing`.

- **O arquivo `.env` está com o nome errado.** Ele precisa se chamar exatamente `.env`. Ative *Exibir → Mostrar → Extensões de nomes de arquivos* no Explorador e confira se não está como `.env.txt` ou `.env.example`.
- **A chave não foi colada.** No `.env`, a linha deve ficar `WEATHERAPI_KEY=suachave`, sem aspas e sem espaços.
- **O YASB não foi reiniciado.** O `.env` só é lido quando o YASB inicia. Rode `yasbc reload`.
- **A chave é nova.** O WeatherAPI pode levar alguns minutos para ativar uma chave recém-criada.

## Os ícones aparecem como quadrados ou símbolos estranhos

Falta uma fonte.
- Ícones da barra: instale a **JetBrainsMono Nerd Font** (`winget install DEVCOM.JetBrainsMonoNerdFont`) e reinicie o YASB.
- Ícones dentro da Central de controle: **Segoe Fluent Icons** (já vem no Windows 11; no Windows 10, instale pelo site da Microsoft).

## A barra aparece no monitor errado (ou em todos)

Ajuste `screens:` no `config.yaml`. Veja [Em qual monitor a barra aparece](personalizacao.md#em-qual-monitor-a-barra-aparece).

## Mudei algo e nada aconteceu

- Confira se salvou o arquivo.
- Rode `yasbc reload`.
- Veja o `yasb.log`: um erro de digitação no `config.yaml` (espaço a mais, aspas faltando) impede o carregamento.

## Errei a indentação do config.yaml

No YAML, os **espaços no começo da linha** definem a estrutura. Use sempre espaços, nunca Tab, e mantenha o alinhamento das linhas vizinhas. Um editor como o [VS Code](https://code.visualstudio.com/) mostra o erro sublinhado em vermelho.

## Um atalho de aplicativo não abre

O caminho em `app_list` (widget `apps`) aponta para um programa que não existe no seu PC. Troque pelo caminho certo: clique com o botão direito no atalho do programa → **Abrir local do arquivo**.

## O Claude Usage mostra erro

Esse widget precisa do [Claude Code](https://claude.com/claude-code) instalado e logado. Se você não usa, apague a linha `"claude_usage",` da lista do lado direito.

## Uma cor ou transparência que eu mudei não aparece

O YASB ignora em silêncio o CSS que ele não entende, como `color-mix()` ou `calc()`. Use `rgba()`. Veja a [regra importante do CSS](personalizacao.md#regra-importante-do-css-do-yasb).

---

Não resolveu? Procure ou pergunte nas [Discussions do YASB](https://github.com/amnweb/yasb/discussions) ou abra uma *issue* neste repositório.
