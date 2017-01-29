try:
    from MonetDBtesting import process
except ImportError:
    import process
import os, sys

dbfarm = os.getenv('GDK_DBFARM')
tstdb = os.getenv('TSTDB')

if not tstdb or not dbfarm:
    print 'No TSTDB or GDK_DBFARM in environment'
    sys.exit(1)

#clean up first
dbname = tstdb
dbnameclone = tstdb + '-clone'

if os.path.exists(os.path.join(dbfarm, dbname)):
    import shutil
    shutil.rmtree(os.path.join(dbfarm, dbname))

if os.path.exists(os.path.join(dbfarm, dbnameclone)):
    import shutil
    shutil.rmtree(os.path.join(dbfarm, dbnameclone))


s = process.server(dbname = dbname, stdin = process.PIPE, stdout = process.PIPE, stderr = process.PIPE)

c = process.client('sql', dbname = dbname, stdin = process.PIPE, stdout = process.PIPE, stderr = process.PIPE)

cout, cerr = c.communicate('''\
call master();
select 1;
create table tmp(i int, s string);
insert into tmp values(1,'hello'), (2,'world');
select * from tmp;
''')

sout, serr = s.communicate()

sys.stdout.write(sout)
sys.stdout.write(cout)
sys.stderr.write(serr)
sys.stderr.write(cerr)
