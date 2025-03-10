# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class BosszhaopinItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    recruit_status = scrapy.Field()     #招聘状态
    release_date = scrapy.Field()       #更新时间
    job_titel = scrapy.Field()          #职位名称
    company_name = scrapy.Field()       #公司名称
    company_number = scrapy.Field()     #公司人数
    industry = scrapy.Field()           #所属行业
    salary_range_low = scrapy.Field()       #薪资
    salary_range_high = scrapy.Field()       #薪资
    salary_range_num= scrapy.Field()       #超薪
    office_location = scrapy.Field()    #地点
    experience_limit = scrapy.Field()   #工作经验
    education_limit = scrapy.Field()    #学历要求
    benefits = scrapy.Field()           #福利
    key_words = scrapy.Field()        #职位关键词
    description = scrapy.Field()        #职位描述

    pass
