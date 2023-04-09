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
            sql ='insert into jobdataspider \
                (recruit_status,release_date,job_titel,company_name,company_number,industry,salary_range_high,salary_range_num,office_location,experience_limit,education_limit,benefits,key_words,description) \
                    values("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s")',\
                        [str(item['recruit_status']),str(item['release_date']),str(item['job_titel']),str(item['company_name']),str(item['company_number']),str(item['industry']),str(item['salary_range_high']),str(item['salary_range_num']),str(item['office_location']),str(item['experience_limit']),str(item['education_limit']),str(item['benefits']),str(item['key_words']),str(item['description'])]
            self.cursor.execute(sql)
            print('插入数据成功')
        except Exception as e:
            print('插入错误',e)
            self.mysql_con.rollback()
        else:
            self.mysql_con.commit()
            print('提交成功')
        return item
    


    def close(self,spider):
        print('断开连接')
        self.cursor.close()
        self.mysql_con.close()
        pass
