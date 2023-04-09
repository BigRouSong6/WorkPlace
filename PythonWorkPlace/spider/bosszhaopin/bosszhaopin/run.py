from scrapy import cmdline,Spider

args = 'scrapy crawl boss_zhaopin1'.split()

if __name__ == '__main__':
    cmdline.execute(args)