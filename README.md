# github contribution summary writer

Y'know that github contribution summary? It's a bit boring isn't it?

![Before image](https://raw.githubusercontent.com/laycat/github-contribution-writer/master/before.png)

But to me it looks like a canvas. So I decided to write a message on mine:

![After image](https://raw.githubusercontent.com/laycat/github-contribution-writer/master/after.png)

Much better. This repo means you can to!

## How To

Requires:
- ruby
- git
- not necessarily in the same shell (for you pesky windows users).

1. Clone the repo
2. Run ./writer.rb, answer it's questions (help below)
3. Take the contribution_set file and run the commands it contains against one
   of your github repos*
4. git push
5. Checkout your fancy contribution summary

* use a junk repo. Create one just for this. This will create a few thousand
commits, and getting rid of them is a bit of a faff.

## Inputs explained

### message:

Characters currently allowed: A-Z0-9o:;!()|=+-? (case sensistive!)
Github can fix about 13 characters into your summary if you set the x offset to
0. If you go over this, commits will be written in the future i.e. will start to
show up in your contribution summary _eventually_

### x offset:

How many squares across to start. 0 is the left most column.

### y offset:

How many squares down to start. 0 is the top row. NB: letters are 5 tall, and
the contribution summary is 7 tall, so a value of 1 centers the message.

### commit times:

How many times to commit per day. This affects how dark the contribution spots
are. This is pretty personal. A good gauge is to check your current max daily
contributions and double that.
If this is too low, the message won't show, if it's too high then your actual
commit history will fade into the background (but your might want that...)

## Erasing messages

If you followed the advice of keeping these commits in a separate junk repo, the
absolute easiest way to remove the message is to delete the repo (and recreate
if you want another message). Otherwise, try a reset and force push (I'm not
explaining this here, it's a bit risky on actual functional repos.)

