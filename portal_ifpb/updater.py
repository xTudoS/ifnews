from apscheduler.schedulers.background import BackgroundScheduler
from .portal_ifpb_scrap import PortalIFPB
from .newsletter import Newsletter
        
def start():
    scheduler = BackgroundScheduler()
    scheduler.add_job(PortalIFPB.update_notices, 'interval', hours=6)
    # scheduler.add_job(Newsletter.send, 'interval', seconds=2)
    scheduler.start()