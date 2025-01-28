## Clean Architecture

Clean Architecture has three layers: data, domain and presentation. I also created two extra pastes: core, responsible by the android/iOS app (the fourth layer) and common, the imgs and etc.

## firebase

Here I used firebase-CLI.
<details>
<summary>Step by Step</summary>

Runned on terminal:
1. `curl -sL https://firebase.tools | bash` (available on https://firebase.google.com/docs/cli)
2. `firebase login`
3. `dart pub global activate flutterfire_cli` to install flutterfire CLI on project (available on https://pub.dev/packages/flutterfire_cli)
  <details>
  <summary>problems solved</summary>
    in my case, I received the follow
    ```txt
    Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
    You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, .zshrc etc.):

      export PATH="$PATH":"$HOME/.pub-cache/bin"
    ```
    The solution was run `cd /etc/profile`, locate bash.bashrc, `sudo nano bash.bashrc` and then pasting the command above.

  </details>
4. `flutterfire configure` inside the project folder, select the **create a new project** option and then follow instructions
5. added `firebase_core:` in pubspec
6. Inside firebase console (console.firebase.google.com), went to authentication > get start > email/pass
</details>