from apscheduler.schedulers.background import BackgroundScheduler
from .portal_ifpb_scrap import PortalIFPB
        
def start():
    scheduler = BackgroundScheduler()
    scheduler.add_job(PortalIFPB.update_notices, 'interval', minutes=10)
    scheduler.start()