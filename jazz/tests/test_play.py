import unittest.mock
import jazz.tests


class PlayHandlerTest(jazz.tests.TestCase):

    @unittest.mock.patch("os.system")
    def test_get(self, system):
        res = self.fetch("/play", method="POST", body="freq=100.0")
        self.assertEqual(res.code, 201)
        system.assert_called_once_with("beep -f 100.0")
