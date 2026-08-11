# Meu YASB personalizado

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

```
%USERPROFILE%\.config\yasb
```

## Recursos

Esta configuração inclui widgets e integrações voltados para uso técnico e produtividade no Windows. Entre os recursos disponíveis estão:

- Relógio com calendário, alarmes e suporte a feriados. 
- Widget de clima com WeatherAPI. (API gratuita)
- Controle de mídia, volume, brilho e Bluetooth. 
- Monitoramento de CPU, GPU, memória, disco e tráfego de rede.
- Notificações, power menu e janela ativa.
- Notas rápidas, tarefas e Pomodoro.
- Launchpad, quicklaunch e atalhos personalizados para apps.
- Integração com GitHub, GitHub Copilot, OBS e Komorebi.
- Suporte a WHKD e outros componentes do ambiente de automação.

## Instalação

1. Instale o YASB no Windows e confirme que ele está funcionando corretamente no seu ambiente. [https://yasb.dev/]
2. Copie `config.yaml`, `styles.css` e o arquivo `.env` para `%USERPROFILE%\\.config\\yasb`.
3. Abra o `config.yaml` e ajuste a seção `screens` com o nome do monitor desejado, porque a barra só aparece nos monitores definidos nessa lista. No arquivo atual existe um exemplo com `Acer KG241`, e isso precisa ser alterado conforme o nome real do seu monitor.
4. Preencha o arquivo `.env` de exemplo com os seus dados reais antes de usar a configuração completa, porque ele contém campos para GitHub, Copilot, WeatherAPI, OBS WebSocket e caminhos personalizados do sistema.
5. Reinicie ou recarregue o YASB após salvar as alterações no `config.yaml` e no `styles.css`.

## Configuração do `.env`

O arquivo `.env` enviado neste projeto é apenas um **modelo de exemplo** e precisa ser preenchido corretamente para que alguns widgets funcionem como esperado. Ele contém variáveis para `GITHUBTOKEN`, `COPILOTTOKEN`, `WEATHERAPIKEY`, `YASBOBSPASSWORD` e também caminhos personalizados usados por widgets como `home` e wallpapers.
Nem todos os dados precisam ser preenchidos, foque nos widgets que você irá usar, e nos atalhos que deseja adicionar a barra de status.

## WeatherAPI

O widget de clima desta configuração depende de uma chave da **WeatherAPI** definida na variável `WEATHERAPIKEY`.

Para configurar corretamente:

1. Acesse [WeatherAPI] https://www.weatherapi.com/ (abra com Ctrl+clique para nova aba). 
2. Crie uma conta gratuita no serviço.
3. Gere sua API key gratuita no painel da plataforma.
4. Substitua o valor de `WEATHERAPIKEY` no arquivo `.env` pela sua chave real.
5. Adicione a cidade que você deseja que a API monitore.

Sem essa chave, o widget de clima não funcionará corretamente.

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

Esta configuração não foi pensada como pacote universal pronto para qualquer máquina sem ajustes. Ela foi organizada para o meu fluxo de uso e depois disponibilizada publicamente para quem quiser adaptar, estudar ou usar como referência

O `styles.css` foi reestruturado com foco em legibilidade, manutenção e consistência visual, centralizando tokens globais, componentes compartilhados, menus reutilizáveis e estilos específicos por widget.

## Base para alterações

Você pode usar este projeto como ponto de partida para montar sua própria barra, removendo widgets, alterando menus, trocando cores, reorganizando os blocos e adicionando integrações conforme a sua necessidade. [file:10]

A proposta é simples: esta é a minha versão pessoal do YASB, publicada como referência aberta para customização.
