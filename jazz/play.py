import urllib.parse
import os
import jazz


class PlayHandler(jazz.RequestHandler):

    def post(self):
        body = urllib.parse.parse_qs(self.request.body.decode())
        freq = float(body.get("freq")[0])
        os.system("beep -f " + str(freq))
        self.set_status(201)
