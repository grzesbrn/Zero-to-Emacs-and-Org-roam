<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/80x15.png" /></a>

# Zero to Emacs and Org-roam: a step-by-step guide on Windows 10

I have added a [script that automates installation](./35.auto-install.md) of packages that I describe in this guide up to [Chapter 6 on ORB](./60.Org-ref_ORB.md).

Let me know how you go. 

Part 1

1. [Get Emacs for Windows](./10.Get-Emacs.md)
2. [Use Emacs to write some text (including copy & paste)](./20.Use-Emacs.md)
3. [Set up Org-roam (including sqlite3)](./30.Set-up-Org-roam.md)
4. [Improve quality-of-life with your font, theme, and minimal select packages ](./40.Qol.md)

The config file at the end of Part 1 is [located in this repo](https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/blob/926c0f07708514bbdc6952dc3bac520d8668cbc1/.emacs), too. Refer to [its history](https://github.com/nobiot/Zero-to-Emacs-and-Org-roam/commits/main/.emacs) if you wish to see the incremental changes as we move along advanced chapters.

![What your Emacs will look like at the end of Part 1](images/2020-06-16_21-32-39.png)

Part 2

5. [Before we start Part 2 -- some notes](./50.Part2.md)
6. [Set up Org-ref and Org-roam-bibtex (ORB)](./60.Org-ref_ORB.md)
7. [Export to MS Word](./70.publish.md)
8. [Set up a spell checker (Hunspell, including how to get it)](./80.Spell-checker.md)

Part 3 

I consider the following "extra" features because they require a certain level of "hacking the system". I suggest that you selectively decide whether or not you would like to take on the challenges, depending on your familiarity wth the technical stuff on Windows.

9. [Set `org-protocol`, `org-roam-graph`, and `org-roam-server` (incl. Windows registry)](./90.org-protocol.md)
10. (maybe) How to swap CapsLock with Ctrl
11. (maybe) Org-noter (incl. How to open PDF within Emacs on Windows)
12. (maybe) Export to PDF

At the end of chapter 6 on ORB, you will get to this point where you can use ORB.
![Add a bibliographic note](images/2020-06-23_22-19-30.png)

Chaper 7 is now published. It demonstrates a way to export your Org notes to MS Word. Resultant `.docx` files look like this:
![Export to MS Word docx document](images/2020-06-27_23-12-59.png)

Chapter 9 lets you play with interactive visualisation of your notes and their relationships via `org-roam-server`:

![Animation showing `org-roam-sever` interacting with Emacs](images/zero-to-org-roam-server.gif)

## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA 4.0 license</a>, except for source code and documentation excerpts from Emacs and Org-roam project.
