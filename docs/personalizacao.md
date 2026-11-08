# Personalização

Tudo aqui é feito editando `config.yaml` (o que aparece e como se comporta) ou `styles.css` (a aparência). Ao salvar, o YASB aplica sozinho. Se não aplicar, rode `yasbc reload` no PowerShell.

> 💾 Antes de mudanças grandes, faça uma cópia dos dois arquivos. Se algo quebrar, é só voltar.

---

## Em qual monitor a barra aparece

No `config.yaml`, perto do topo:

```yaml
screens: ['*']   # '*' = todos os monitores
```

Para mostrar só em um monitor, coloque o nome dele:

```yaml
screens: ['Acer KG241']
```

**Como descobrir o nome do monitor**
- Pelo Windows: **Configurações → Sistema → Tela → Tela avançada**. O nome aparece em "Informações de exibição".
- Pelo YASB: abra o arquivo `yasb.log` (na mesma pasta) e procure por `on screen`. Quando essa linha aparece, o nome vem logo depois. Ela só é registrada em algumas situações, como ao ligar ou trocar um monitor.

---

## Mudar a posição da barra

```yaml
alignment:
  position: "top"     # "top" = em cima, "bottom" = embaixo
dimensions:
  height: 36          # altura em pixels
```

---

## Mudar as cores

Todas as cores ficam no começo do `styles.css`, na seção `:root`:

```css
:root {
  --bg-color1: #191919;   /* fundo da barra */
  --text1: #d8dbe3;       /* texto principal */
  --blue: #88b8ff;        /* cor de destaque */
  --popup-bg: rgba(25, 25, 25, 0.95);  /* fundo dos menus */
  ...
}
```

Troque o código da cor e salve. Para escolher cores, use um seletor como o [htmlcolorcodes.com](https://htmlcolorcodes.com/pt/).

### Transparência dos menus

Em `--popup-bg: rgba(25, 25, 25, 0.95);`, o **último número** é a opacidade:

| Valor | Resultado |
|---|---|
| `1` | Sólido |
| `0.95` | Quase sólido (padrão) |
| `0.85` | Levemente transparente, mostrando o desfoque atrás |

### Regra importante do CSS do YASB

O YASB não é um navegador. Algumas coisas comuns em CSS **não funcionam** e são ignoradas **sem mostrar erro**:

| ❌ Não funciona | ✅ Use no lugar |
|---|---|
| `color-mix(in srgb, var(--blue) 30%, transparent)` | `rgba(136, 184, 255, 0.3)` |
| `calc(...)` | O valor já calculado |
| `@media (...)` | — |
| `transition: ...` (animação suave) | Não use no YASB v2.0.7: ela trava o hover e o ligar/desligar dos botões nos menus |

Funcionam: `var(--nome)`, `rgba()`, `#RRGGBB`, `#RRGGBBAA`, `linear-gradient()`, `text-shadow`, `box-shadow`, `@import`.

---

## Trocar ícones

Os ícones são caracteres especiais da fonte **Nerd Font**, escritos no formato `\uXXXX`:

1. Procure o ícone em [nerdfonts.com/cheat-sheet](https://www.nerdfonts.com/cheat-sheet).
2. Copie o código (ex.: `f4bc`).
3. No `config.yaml`, use dentro de aspas duplas: `"\uF4BC"`.

Códigos com **5 dígitos** (ex.: `f08ae`) viram **dois** blocos `\u`. O jeito mais fácil é pedir a conversão a um conversor de "UTF-16 surrogate pair". O resultado fica assim: `"\uDB82\uDCAE"`.

> Os ícones dentro da **Central de controle** usam outra fonte, a *Segoe Fluent Icons*. Os códigos dela estão no [site da Microsoft](https://learn.microsoft.com/pt-br/windows/apps/design/style/segoe-fluent-icons-font).

---

## Mudar widgets de lado

Em `bars:` → `status-bar:` → `widgets:`, recorte a linha do widget de uma lista (`left`, `center`, `right`) e cole em outra. A ordem na lista é a ordem na barra.

---

## Sombras nos textos

A sombra dos ícones e textos da barra é definida por um token no `:root` (começo do `styles.css`):

```css
--shadow-text: 1px 1px 3px black;   /* deslocamento X, Y, desfoque, cor */
```

A lista de widgets que recebem a sombra fica na seção **24** do `styles.css`. Para tirar a sombra de um widget, apague o seletor dele dessa lista. Para tirar de todos, apague a regra inteira da seção 24.

> As opções antigas `label_shadow` e `container_shadow` dentro do `config.yaml` foram **descontinuadas** pelo YASB. Use o CSS.

---

## Seus próprios atalhos de pastas

1. No `.env`, crie uma linha: `MinhaPasta=D:\Projetos`
2. No `config.yaml`, em `home:` → `menu_list:`, adicione:
   ```yaml
   - {title: "Projetos", path: "$env:MinhaPasta"}
   ```
3. Rode `yasbc reload`.
