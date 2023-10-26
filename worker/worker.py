from celery import Celery
import os

import BirdNetScripts.analyze as bn


app = Celery(
    'birdnet',
    broker=os.environ.get("CELERY_BROKER", "redis://redis:6379/0"),
    backend= os.environ.get("CELERY_BROKER", "redis://redis:6379/0"),
)

@app.task(name='addTask')  # Named task
def add(x, y):
    print('Task Add started')
    print('Task Add done')
    return x + y
    
@app.task(name='AnalysisTask')  # Named task
def BirdnetAnalysis(args):
    allsuccess, allresults = bn.RunAnalysis(args)
    return (allsuccess, allresults)
