# YASB personalizado

Configuração personalizada do **YASB (Yet Another Status Bar)** para Windows, criada para uso diário com foco em produtividade, monitoramento do sistema e acesso rápido a funções importantes do desktop. Esta versão foi montada e ajustada para o meu próprio ambiente, mas está publicada para servir como base de estudo, adaptação e personalização por outras pessoas.

Este projeto utiliza uma barra principal `status-bar`, uma barra de tarefas opcional `yasb-taskbar` e um tema visual reestruturado em `styles.css`, com widgets voltados para clima, mídia, monitoramento de hardware, produtividade e integração com ferramentas externas.

## Créditos

Este projeto foi construído com base no repositório do **WINchester**, que serviu como referência estrutural e de organização para o setup. O repositório-base utilizado foi [winchestercanal/Yasb](https://github.com/winchestercanal/Yasb).

A ideia aqui não é replicar exatamente a configuração original, mas sim manter uma versão própria, ajustada para o meu uso, com mudanças em layout, widgets, organização e estilo.

## Arquivos

Os arquivos principais deste projeto são:

- `config.yaml` — configuração principal da barra, widgets, menus, callbacks e comportamento geral.
- `styles.css` — tema visual completo, com cores, tipografia, popups, menus e ajustes dos widgets.
- `.env` ou `file.env` — arquivo de variáveis de ambiente usado para tokens, chaves de API, senhas e caminhos personalizados.

Coloque os arquivos no diretório abaixo:

```powershell
%USERPROFILE%\.config\yasb
```

## Recursos

Esta configuração inclui widgets e integrações voltados para uso técnico e produtividade no Windows. Entre os recursos disponíveis estão:

- Relógio com calendário, alarmes e suporte a feriados.
- Widget de clima com WeatherAPI.
- Controle de mídia, volume, brilho e Bluetooth.
- Monitoramento de CPU, GPU, memória, disco e tráfego de rede.
- Notificações, power menu e janela ativa.
- Notas rápidas, tarefas e Pomodoro.
- Launchpad, quicklaunch e atalhos personalizados para apps.
- Integração com GitHub, GitHub Copilot, OBS e Komorebi.
- Suporte a WHKD e outros componentes do ambiente de automação.

## Instalação

Antes de usar esta configuração, instale o **YASB** e a fonte **JetBrainsMono Nerd Font**, pois ela é necessária para exibir corretamente vários ícones e glyphs usados na barra e em alguns widgets.

### 1. Instale o YASB e a fonte necessária

Abra o **PowerShell** ou **Terminal do Windows** e execute:

```powershell
winget install amn.yasb DEVCOM.JetBrainsMonoNerdFont
```

Se preferir, a fonte também pode ser baixada manualmente pelo site oficial da Nerd Fonts:

[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

### 2. Copie os arquivos de configuração

Coloque os arquivos abaixo no diretório:

```powershell
%USERPROFILE%\.config\yasb
```

Arquivos:
- `config.yaml`
- `styles.css`
- `.env` (arquivo de exemplo, precisa ser preenchido)

### 3. Configure o monitor onde a barra vai aparecer

Abra o `config.yaml` e ajuste a seção `screens`, porque a barra só será exibida nos monitores informados nessa lista.

Exemplo atual no arquivo:

```yaml
screens: ['Acer KG241']
```

Se o nome do seu monitor for diferente, altere para o nome correto. Sem isso, a barra pode não aparecer no monitor desejado.

### 4. Preencha o arquivo `.env`

O arquivo `.env` enviado neste projeto é apenas um **modelo de exemplo** e deve ser editado com as suas informações reais.

Nele você pode configurar, por exemplo:
- Token do GitHub
- Token do Copilot
- Senha do OBS WebSocket
- Caminhos personalizados
- Chave da WeatherAPI

### 5. Configure a WeatherAPI

Para o widget de clima funcionar corretamente, crie uma conta gratuita em:

[https://www.weatherapi.com/](https://www.weatherapi.com/)

Depois, gere sua API key e adicione o valor no campo `WEATHERAPIKEY` dentro do arquivo `.env`.

### 6. Reinicie ou recarregue o YASB

Após ajustar os arquivos, reinicie o YASB ou recarregue a configuração para aplicar tudo corretamente.

## Personalização

Esta é uma versão criada e personalizada por mim, pensada primeiro para o meu uso pessoal no Windows. Por isso, várias partes do projeto refletem meu ambiente, meus caminhos locais, minhas integrações e minha organização de widgets.

Alguns itens que normalmente precisam ser ajustados antes do uso são:

- Nome do monitor na seção `screens`.
- Caminhos locais de programas e pastas.
- Tokens de GitHub e Copilot.
- Senha do OBS WebSocket.
- Chave da WeatherAPI.
- Componentes opcionais como Komorebi, WHKD e integrações extras.

## Observações

Esta configuração não foi pensada como pacote universal pronto para qualquer máquina sem ajustes. Ela foi organizada para o meu fluxo de uso e depois disponibilizada publicamente para quem quiser adaptar, estudar ou usar como referência.

O `styles.css` foi reestruturado com foco em legibilidade, manutenção e consistência visual, centralizando tokens globais, componentes compartilhados, menus reutilizáveis e estilos específicos por widget.

## Base para alterações

Você pode usar este projeto como ponto de partida para montar sua própria barra, removendo widgets, alterando menus, trocando cores, reorganizando os blocos e adicionando integrações conforme a sua necessidade.

A proposta é simples: esta é a minha versão pessoal do YASB, publicada como referência aberta para customização.
