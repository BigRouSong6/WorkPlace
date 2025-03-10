import scrapy,time,random
from urllib import parse
from selenium import webdriver
from bosszhaopin.items import BosszhaopinItem

print('请输入关键词（岗位名词/行业等）：')
key_word = str(input())
url_quote = 'https://www.zhipin.com/web/geek/job?city=101280600&query='+parse.quote(key_word)

class BossZhaopin1Spider(scrapy.Spider):
    name = "boss_zhaopin1"
    allowed_domains = ["www.zhipin.com"]
    start_urls = [url_quote]

    def __init__(self):
        print("初始化浏览器")
        self.options  = webdriver.ChromeOptions()
        #忽略证书错误
        self.options.add_argument('--ignore-certificate-errors')
        self.options.add_experimental_option('excludeSwitches', ['enable-automation'])
        self.options.add_experimental_option('excludeSwitches', ['enable-logging'])
        # self.options.add_argument('--headless')
        self.bro = webdriver.Chrome(executable_path='D:\其他杂物\chromedriver.exe',options = self.options)

    def parse(self, response):
        item = BosszhaopinItem()
        try:
            li_list = response.xpath('//li[@class="job-card-wrapper"]')
            for li in li_list:
                # item['recruit_status'] = "None"
                # item['release_date'] = "None"
                # item['description'] = "None"
                item['job_titel']  = li.xpath('.//span[@class="job-name"]//text()').extract_first()
                item['company_name']  = li.xpath('.//h3[@class="company-name"]//text()').extract_first()
                item['company_number']  = li.xpath('.//ul[@class="company-tag-list"]/li[last()]/text()').extract_first()
                item['industry']  = li.xpath('.//ul[@class="company-tag-list"]/li[1]/text()').extract_first()
                item['salary_range_low']  = int(li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[0])
                try:
                    item['salary_range_high']  = int(li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[1].split('K')[0])
                except:
                    item['salary_range_high']  = int(li.xpath('.//span[@class="salary"]//text()').extract_first().split("-")[1].split('K')[0])
                try:
                    item['salary_range_num']  = int(li.xpath('.//span[@class="salary"]//text()').extract_first().split("·")[1].split("薪")[0])
                except:
                    item['salary_range_num']  = 12
                item['office_location']  = li.xpath('.//span[@class="job-area"]//text()').extract_first()
                item['experience_limit']  = li.xpath('.//ul[@class="tag-list"]/li[1]/text()').extract_first()
                item['education_limit']  = li.xpath('.//ul[@class="tag-list"]/li[last()]/text()').extract_first()
                if item['education_limit']  == None:
                    item['education_limit'] = "None"
                item['benefits']  = li.xpath('.//div[@class="info-desc"]//text()').extract_first()
                item['description']  = li.xpath('.//span[@class="job-name"]//text()').extract_first()
                item['key_words']  = "-".join(li.xpath('.//div[@class="job-card-footer clearfix"]/ul[@class="tag-list"]//li//text()').extract())
                time.sleep(random.randint(2,4))
                yield item
                # yield scrapy.Request(
                #     url = url_detail,
                #     callback = self.parse 
                # )
        except:
            pass


            #翻页
        for page in range(2,11):
            url_next = url_quote+'&page='+parse.quote(str(page))
            yield scrapy.Request(
                url = url_next,
                callback = self.parse
            )

        

    def close(self,spider):
        self.bro.quit()
        print('爬虫结束，关闭浏览器')
        time.sleep(1)