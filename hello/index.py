import hello


class IndexHandler(hello.RequestHandler):

    def get(self):
        self.render("index.html")
