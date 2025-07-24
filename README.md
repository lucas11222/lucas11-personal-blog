# Lucas11 Personal blog

## Hello! this is my personal blog!

Here you can find me talking about cool stuff, things i wanna to talk, etc.

That basicly it! made for railway!
API:

GET /api/(id) Shows an post with an id.

GET /api Shows all the posts.

PATCH (or PUT) /api/(id) Updates an post. (needs body)

POST /api Creates a post. (needs body)

DELETE /api/(id) Deletes a post.

body for PATCH and POST:

json```
```
{
  "blog_post": {
    "title": "THE POST",
    "description": "ello",
    "body": "# hello"
  }
}
```
(the error handleing is in the api not in blog_posts please dont use that and if you have questions of the api maybe the api_controler can help you out.)
