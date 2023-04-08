import scrapy,time
from urllib import parse
from selenium import webdriver
from bosszhaopin.items import BosszhaopinItem

key_word = "爬虫"
url_quote = 'https://www.zhipin.com/web/geek/job?city=101280600&query='+parse.quote(key_word)

class BossZhaopin1Spider(scrapy.Spider):
    name = "boss_zhaopin1"
    allowed_domains = ["www.zhipin.com"]
    start_urls = [url_quote]

    def __init__(self):
        print("初始化浏览器")
        self.bro = webdriver.Chrome(executable_path='D:\其他杂物\chromedriver.exe')


    def parse(self, response):
        item = BosszhaopinItem()
        
        pass


    def closed(self,spider):
        print('爬虫结束，关闭浏览器')
        self.bro.quit