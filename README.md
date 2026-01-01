# typst_templates

To use a template in the typst script, do the following:

```typst
// Import the function from github
#import "https://raw.githubusercontent.com/klemengit/typst_templates/main/template.typ": project

// Call the template function
#show: project

// Call the template function with arguments (if they exist)
#show: project.with(
  title: "Test implementation",
  authors: ("Klemen Zaletelj",),
  date: datetime.today().display(),
)
```
