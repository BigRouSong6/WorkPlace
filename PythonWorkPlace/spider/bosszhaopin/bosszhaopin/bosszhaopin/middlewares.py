# Define here the models for your spider middleware
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/spider-middleware.html


import time,random
from scrapy.http.response.html import HtmlResponse
from urllib import response

class BosszhaopinDownloaderMiddleware:


    def process_response(self, request, response, spider):
        #修改需要动态取数的页面返回的response
        spider.bro.get(request.url)
        print(request.url)
        javascript = 'window.scrollTo(0,document.body.scrollHeight)'  #下拉一个屏幕
        spider.bro.execute_script(javascript)
        time.sleep(random.randint(5,10))
        page_text = spider.bro.page_source
        return HtmlResponse(url = spider.bro.current_url,body=page_text,encoding = "utf-8",request = request)
