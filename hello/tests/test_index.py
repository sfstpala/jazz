import hello.tests


class IndexHandlerTest(hello.tests.TestCase):

    def test_get(self):
        res = self.fetch("/", follow_redirects=False)
        self.assertEqual(res.code, 200)
