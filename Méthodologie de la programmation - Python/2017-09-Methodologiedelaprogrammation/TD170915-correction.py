
# Exercice 1

def iso_to_tuple(dt):
    d, t = dt.split(' ')
    return tuple(map(int, d.split('-') + t.split(':')))


# Exercice 2

def calc_diff(dt1, dt2):
    t1 = iso_to_tuple(dt1)
    t2 = iso_to_tuple(dt2)
    s1 = t1[2] * 86400 + t1[3] * 3600 + t1[4] * 60 + t1[5]
    s2 = t2[2] * 86400 + t2[3] * 3600 + t2[4] * 60 + t2[5]
    return s1 - s2


# Exercice 3

durees = []

fp = open('trains.txt', 'r')
lines = fp.readlines()
for i in range(0, len(lines), 3):
    title = lines[i].strip()
    dt1 = lines[i+1].strip()
    dt2 = lines[i+2].strip()
    delta = calc_diff(dt2, dt1)
    durees.append((title, delta))
fp.close()

fp = open('durees.txt', 'w')
for title, secs in durees:
    fp.write("%s: %02d:%02d\n" % (title, secs // 3600, (secs % 3600) // 60))
fp.close()
