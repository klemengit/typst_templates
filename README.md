# typst_templates

To use a template in the typst script, do the following:

```typst
// Import the function from the template (must be in the same directory)
#import "template.typ": project

// Call the template function
#show: project

// Call the template function with arguments (if they exist)
#show: project.with(
  title: "Test implementation",
  authors: ("Klemen Zaletelj",),
  date: datetime.today().display(),
)
```
