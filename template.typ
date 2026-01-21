
#let project(
  title: none,
  authors: (),
  date: none,
  logo_path: none,
  body
) = {
  // Set document metadata
  if title != none {
    set document(title: title)
  }
  if authors != () {
    set document(author: authors)
  }

  // Page setup
  set page(
    paper: "a4", 
    margin: (x: 1.1in, y: 1in),
    numbering: "1",
    header: [
      #grid(
        columns: (2fr, 3fr),
        align: (left, right),
        if logo_path != none {
          image(logo_path, width: 90%)
        },
        title
      )
    ],
  )

  set par(
    justify: true,
    leading: 0.65em,
  )

  set text(
    font: "new computer modern",
    // font: "Latin Modern Sans 12",
    size: 11pt
  )

  set math.equation(numbering: "(1)")

  // Figure and table formatting
  show figure: set figure(supplement: [Figure])
  show figure.where(kind: table): set figure.caption(position: top)
  
  // Custom reference formatting
  show ref: it => {
    let el = it.element
    if el == none {
      return it
    }
    
    if el.func() == figure {
      let num = counter(figure).at(el.location())
      let supplement = if el.kind == table {
        [Tab.]
      } else {
        [Fig.]
      }
      link(it.target)[#supplement #numbering(el.numbering, ..num)]
    }
    else if el.func() == math.equation {
      let num = counter(math.equation).at(el.location())
      link(it.target)[Eq. #numbering(el.numbering, ..num)]
    }
    else {
      it
    }
  }

  set heading(numbering: "1.1")
  show heading: set block(above: 1.4em, below: 0.8em)

  // Title block
  if title != none {
    align(center)[
      #text(size: 17pt, weight: "bold")[#title]
    ]
    v(1em)
  }
  
  if authors != () {
    align(center)[
      #authors.join(", ")
    ]
    v(1em)
  }
  
  if date != none {
    align(center)[
      #date
    ]
    v(2em)
  }

  body
}
