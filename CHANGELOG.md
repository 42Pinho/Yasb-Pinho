# Changelog

## v2.0 (novembro de 2026)

Atualização completa para o **YASB v2.0.7**.

### Corrigido
- **Clima e atalhos de pasta não funcionavam.** O arquivo de variáveis era publicado como `env.txt`, mas o YASB só lê um arquivo chamado exatamente `.env`. Agora o repositório traz `.env.example`, com instruções para renomear.
- **50 regras de estilo nunca tinham funcionado.** O tema usava `color-mix()`, que o motor de CSS do YASB não entende e descarta em silêncio. Por isso fundos, bordas e efeitos de hover não apareciam. Todas foram convertidas para `rgba()`.
- Menus que abrem ao clicar (CPU, GPU, memória, disco, clima, busca rápida) estavam transparentes demais e difíceis de ler. Agora usam um fundo quase sólido, ajustável pelo token `--popup-bg`.
- A barra de uso no menu de discos aparecia apagada.
- Os botões do cartão de clima não mostravam qual opção estava selecionada.
- O quick_launch tinha dois provedores com o mesmo prefixo `*`.

### Atualizado para o YASB v2.0.7
- Opções descontinuadas foram substituídas: `label_shadow`, `container_shadow` e `container_padding` (agora via CSS), `volume_icons` (agora `icons`), `calendar.distance` (agora `offset_top`), `alignment.center` (agora `align`) e `blur_effect.acrylic` (removida).
- Removido o CSS do widget AI Chat, excluído do YASB na v2.0.6.

### Adicionado
- **Visualizador de áudio** nativo (sem depender do Cava), que some no silêncio.
- **Claude Usage**: uso dos limites do Claude Code.
- **Central de controle**: Não perturbe, modo escuro, captura de tela, sliders de áudio e plano de energia.
- Ícones diferentes para CPU, memória e GPU.
- Menu de energia em português.
- Cartão de clima sem a opção de neve.
- Comentários e guia de uso dentro do `config.yaml` e do `styles.css`.
- Documentação para iniciantes (`docs/`), prints da barra e licença MIT.

## v1.0 (agosto de 2026)

- Primeira versão publicada: `config.yaml`, `styles.css` e `env.txt`.
