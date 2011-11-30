from distutils.core import setup
import os, sys, glob

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(name="F-r-eiertag",
      scripts=['freiertag'],
      version='1.0',
      maintainer="Gabriel Boehme",
      maintainer_email="m.gabrielboehme@googlemail.com",
      description="App die deutsche Schulferien und Feiertage anzeigen kann.",
      long_description=read('freiertag.longdesc'),
      data_files=[('share/applications',['freiertag.desktop']),
                  ('share/icons/hicolor/80x80/apps', ['freiertag.png']),
                  ('share/freiertag/data/2011/ferien', glob.glob('data/2011/ferien/*.ics')),
                  ('share/freiertag/data/2011/feiertage', glob.glob('data/2011/feiertage/*.ics')),
                  ('share/freiertag/data/2012/ferien', glob.glob('data/2012/ferien/*.ics')),
                  ('share/freiertag/data/2012/feiertage', glob.glob('data/2012/feiertage/*.ics')),
                  ('share/freiertag/data/2013/ferien', glob.glob('data/2013/ferien/*.ics')),
                  ('share/freiertag/data/2013/feiertage', glob.glob('data/2013/feiertage/*.ics')),
                  ('share/freiertag/qml', glob.glob('qml/*.qml')), ],)
