# Windows10 App Remover
This is a quick PowerShell script that attempts to remove the Default Windows 10 Applications and its associated packages.

This script was developed on Windows 10 Pro x64 (64-bit). If you have any issues using this with Windows 10 Home - then please let me know!

__Note__: Please understand that there is __NO UNDO__ after running this script. I recommend only running this script on a fresh install (including upgrades). It's possible that these scripts can cease to function after certain updates, so please post a pull request if you have an issue/fix.

## Usage:

1. Install all available updates.
2. Edit the script to fit your need.
3. Run the App Remover Script
4. Reboot the Computer

## Execution:

Start Powershell in Elevated Mode

__Start > Powershell > Right-Click > Run As Administrator__

Enable Execution of PowerShell Scripts:

```
PS> Set-ExecutionPolicy Unrestricted
```

Navigate to where you saved the script, and run the script.

__Example:__ If I saved the script to my desktop:

```
PS C:\Windows\system32> cd..
PS C:\Windows> cd..
PS C:\> cd .\Users
PS C:\Users> cd .\UserName
PS C:\Users\Cryogenix> cd .\Desktop
PS C:\Users\Cryogenix\Desktop> .\remove-default.ps1
```

Once completed, set PowerShell Execution Policy to Restricted.
This is to prevent any execution of accidental/malicious PS Scripts

```
PS> Set-ExecutionPolicy Restricted
```

## Disclaimer:

THIS SCRIPT IS PROVIDED “AS IS” FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL I OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) SUSTAINED BY YOU OR A THIRD PARTY, HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT ARISING IN ANY WAY OUT OF THE USE OF THIS ACRIPT, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

__Note:__ Please read all scripts and understand what they are doing before executing them!
