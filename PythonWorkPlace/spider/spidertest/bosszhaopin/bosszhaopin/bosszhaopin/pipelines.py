# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
from tkinter import E
import pymysql

class BosszhaopinPipeline:
    def __init__(self):
        self.mysql_con = pymysql.connect(host='localhost',user='root',password='yuhuyi94520@',port=3306,database='jobdata',charset='utf8')
        self.cursor = self.mysql_con.cursor()
        print('连接数据库成功')

    def process_item(self, item, spider):
        try:
            sql = 'insert into jobdataspider (job_titel,company_name,company_number,industry,salary_range_low,salary_range_high,salary_range_num,office_location,experience_limit,education_limit,benefits,key_words) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
            # recruit_status = item['recruit_status']
            # release_date = item['release_date']
            job_titel = item['job_titel']
            company_name = item['company_name']
            company_number = item['company_number']
            industry = item['industry']
            salary_range_low = item['salary_range_low']
            salary_range_high = item['salary_range_high']
            salary_range_num = item['salary_range_num']
            office_location = item['office_location']
            experience_limit = item['experience_limit']
            education_limit = item['education_limit']
            benefits = item['benefits']
            key_words = item['key_words']
            # description = item['description']
            data = (job_titel,company_name,company_number,industry,salary_range_low,salary_range_high,salary_range_num,office_location,experience_limit,education_limit,benefits,key_words)
            self.cursor.execute(sql,data)
            print('《---------------------------------插入数据成功')
            print(data)
        except Exception as e:
            print('插入错误',e)
            self.mysql_con.rollback()
        else:
            self.mysql_con.commit()
            print('---------------------------------提交成功》\n\n')
            return item   #必须返回


    def close_spider(self,spider):
        self.cursor.close()
        self.mysql_con.close()
        print('断开数据库连接')
