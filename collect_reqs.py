import os
import pipreqs
import sys


#$INPUT_REQUIREMENT_PATH $INPUT_PROJECT_PATH $RECURSIVE

def main(args):
    result = [args[1]]
    reqs = []
    if args[2]:
        result += [os.path.join(dp, f) for dp, dn, filenames in os.walk(args[1])
                   for f in filenames if os.path.splitext(f)[1] == '.py']
    for path in result:
        os.system(f'pipreqs --force --savepath {args[0]} {path}')
        with open(args[0], 'r') as f:
            reqs += f.readlines()
    reqs = list(set(reqs))
    with open(args[0], 'w') as f:
        f.writelines(reqs)


if __name__ == '__main__':
    args = sys.argv
    main(args[1:])
