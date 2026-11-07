# Widgets

O `config.yaml` tem duas partes:

1. **`bars:` → `widgets:`**: a lista do que **aparece** na barra (esquerda, centro e direita).
2. **`widgets:`**, mais abaixo: as **opções** de cada widget, em ordem alfabética. Funciona como um catálogo. Um widget só aparece se o nome dele estiver na lista do item 1.

Para **ligar** um widget do catálogo, adicione o nome dele (entre aspas, com vírgula) na lista do lado que quiser. Para **desligar**, coloque um `#` no começo da linha.

```yaml
widgets:
  left:
    [
      "home",
      "media",
      #"wallpapers",   # ← desligado; tire o # para ligar
    ]
```

---

## Widgets ativos

| Widget | Lado | Clique esquerdo | Clique do meio | Clique direito | Precisa de |
|---|---|---|---|---|---|
| `home` | esq. | Abre o menu de pastas | — | — | Caminhos das pastas no `.env` |
| `media` | esq. | Menu do player | Alterna o texto | Play/pause | Nada |
| `audio_visualizer` | esq. | — | — | — | Nada |
| `apps` | esq. | Abre o programa | — | — | Caminhos dos **seus** programas em `app_list` |
| `clock` | centro | Calendário | Próximo fuso horário | Alterna o texto | Nada |
| `weather` | centro | Previsão detalhada | — | Alterna o texto | `WEATHERAPI_KEY` no `.env` e sua cidade em `location` |
| `claude_usage` | dir. | Popup de uso | — | 5 horas ↔ 7 dias | [Claude Code](https://claude.com/claude-code) instalado e logado |
| `traffic` | dir. | Menu de rede | — | Alterna o texto | Nada |
| `disk` | dir. | Todos os discos | Alterna o texto | Abre o C: no Explorer | Nada (edite as letras em `volume_labels`) |
| `cpu` | dir. | Gráfico de uso | Gerenciador de Tarefas | Alterna o texto | Nada |
| `memory` | dir. | Gráfico de uso | — | — | Nada |
| `gpu` | dir. | Gráfico de uso | — | Temperatura | Placa NVIDIA ou AMD |
| `volume` | dir. | Mixer de volume | — | Mudo | Nada |
| `control_center` | dir. | Central de controle | — | — | Nada |
| `power_menu` | dir. | Reiniciar / Desligar | — | — | Nada |

> **Não usa Claude Code?** Apague a linha `"claude_usage",` da lista do lado direito.

---

## Clima sem chave

O widget `weather` usa o WeatherAPI, que exige uma chave grátis. Se não quiser criar conta, use o **Open-Meteo**:

1. Na lista do centro, troque `"weather",` por `"open_meteo",`.
2. Salve e clique no widget: ele abre uma busca. Digite sua cidade e escolha na lista.

A cidade fica salva no computador. Para trocar depois, clique no nome da cidade dentro do cartão do clima.

---

## Catálogo: widgets desligados que você pode ligar

| Widget | O que faz | Precisa de |
|---|---|---|
| `active_window` | Título da janela em foco | Nada |
| `battery` | Bateria | Notebook |
| `bluetooth` | Dispositivos Bluetooth | Bluetooth no PC |
| `brightness` | Brilho da tela | Notebook ou monitor compatível |
| `cava` | Visualizador de áudio (alternativo) | Programa [Cava](https://github.com/karlstav/cava) ≥ 0.10.4 no PATH. Prefira o `audio_visualizer`, que já vem pronto |
| `copilot` | Uso do GitHub Copilot | `COPILOT_TOKEN` no `.env` |
| `disk_group` / `grouper` | Discos e widgets agrupados | Nada |
| `github` | Notificações do GitHub | `GITHUB_TOKEN` no `.env` |
| `ip_info` | Seu IP público e localização | Internet (usa ipinfo.io) |
| `komorebi_*` | Controles do gerenciador de janelas Komorebi | [Komorebi](https://github.com/LGUG2Z/komorebi) instalado |
| `language` | Idioma do teclado | Nada |
| `launchpad` | Lançador de apps em tela cheia | Nada |
| `microphone` | Microfone (mudo/volume) | Nada |
| `notifications` | Central de notificações | Nada |
| `notes` | Notas rápidas | Nada |
| `obs` | Status de gravação/live do OBS | OBS com WebSocket ativo e `YASB_OBS_PASSWORD` no `.env` |
| `open_meteo` | Clima sem chave | Nada (veja acima) |
| `pomodoro` | Timer Pomodoro | Nada |
| `power_plan` | Plano de energia do Windows | Nada |
| `quick_launch` | Busca rápida (apps, calculadora, arquivos...) | Para buscar arquivos: [Everything](https://www.voidtools.com/) (`winget install voidtools.Everything`), ou troque `backend: "everything"` por `"auto"` |
| `recycle_bin` | Lixeira (clique direito esvazia) | Nada |
| `server_monitor` | Verifica se sites estão no ar | Edite a lista `servers` |
| `todo` | Lista de tarefas | Nada |
| `update_check` | Atualizações do Windows e do winget | Nada |
| `wallpapers` | Galeria de papéis de parede | `YASB_WALLPAPER_PATHS` no `.env`. **Apague** o bloco `run_after` (ele chama programas que você provavelmente não tem) |
| `wifi` | Wi-Fi | Placa Wi-Fi |
| `whkd` | Mostra atalhos de teclado do whkd | [whkd](https://github.com/LGUG2Z/whkd) instalado |
| `window_controls` | Minimizar/maximizar/fechar a janela ativa | Nada |
| `windows_workspaces` | Áreas de trabalho virtuais do Windows | Nada |
| `win_button` | Botão do menu Iniciar | Nada |

### Barra de tarefas (`yasb-taskbar`)

O `config.yaml` também traz uma **segunda barra**, desligada, que substitui a barra de tarefas do Windows (widgets `quick_launch`, `taskbar` e `systray`). Para testar, em `bars:` → `yasb-taskbar:`, troque `enabled: false` por `enabled: true`.

---

Documentação oficial de cada widget: [wiki do YASB](https://github.com/amnweb/yasb/wiki).
