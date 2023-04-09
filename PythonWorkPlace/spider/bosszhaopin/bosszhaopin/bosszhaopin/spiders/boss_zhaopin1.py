import scrapy,time,random
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
        
        li_list = response.xpath('//li[@class="job-card-wrapper"]')
        for li in li_list:
            item['job_titel']  = li.xpath('.//span[@class="job-name"]//text()').extract_first()
            item['company_name']  = li.xpath('.//h3[@class="company-name"]//text()').extract_first()
            item['company_number']  = li.xpath('.//ul[@class="company-tag-list"]/li[last()]/text()').extract_first()
            item['industry']  = li.xpath('.//ul[@class="company-tag-list"]/li[1]/text()').extract_first()
            item['salary_range_low']  = li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[0]
            
            try:
                item['salary_range_high']  = li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[1].split('K')[0]
            except:
                item['salary_range_high']  = li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[1].split('K')[0]
            try:
                item['salary_range_num']  = li.xpath('.//span[@class="salary"]//text()').extract_first().split("·")[1].split("薪")[0]
            except:
                item['salary_range_num']  = '12'
            item['office_location']  = li.xpath('.//span[@class="job-area"]//text()').extract_first()
            item['experience_limit']  = li.xpath('.//ul[@class="tag-list"]/li[1]/text()').extract_first()
            item['education_limit']  = li.xpath('.//ul[@class="tag-list"]/li[last()]/text()').extract_first()
            item['benefits']  = li.xpath('.//div[@class="info-desc"]//text()').extract_first()
            item['description']  = li.xpath('.//span[@class="job-name"]//text()').extract_first()
            item['key_words']  = "-".join(li.xpath('.//div[@class="job-card-footer clearfix"]/ul[@class="tag-list"]//li//text()').extract())
            time.sleep(random.randint(2,4))
            pass
            # yield item
            # yield scrapy.Request(
            #     url = url_detail,
            #     callback = self.parse 
            # )


            #翻页
        for page in range(2,11):
            url_next = url_quote+'&page='+parse.quote(str(page))
            print(url_next)



    def closed(self,spider):
        print('爬虫结束，关闭浏览器')
        self.bro.quit