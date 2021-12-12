# MacVM

macOS Monterey added support for virtualizing macOS with Apple silicon host.

This project provides an example project for the setup.

## Added functionalities from main repo

Full credits to Khaos Tian, fantastic work.
So far I've added the ability to boot to Recovery, done by clicking on the '**R**'
button.

(https://gist.github.com/KhaosT/8167170d1452daec1ba292e37e5768c8)

This is super convenient if you need to test things with SIP/AMFI disabled, or if
you need to do kernel debugging. Although kernel debugging on M1 appears to be still
at the point where you can only inspect current state.

I have also added the ability to get serial output and enable a GDB stub within
Virtualization.framework, they can be toggled ON/OFF through two new buttons.
'**S**' enables serial output, '**D**' enables debug functionalities.

On the topic of having a functioning GDB stub, you will need to `amfi_get_out_of_my_way=1`
in order to run MacVM with `com.apple.private.virtualization`. You will need to
add it manually to MacVM.entitlements. Without the entitlement, the VM will sometime
fail to start - when it doesn't, you will see the GDB stub port open (3335) but
connection will fail with "failed to get reply to handshake packet".

Serial port code and private entitlement info taken from (https://github.com/NyanSatan/Virtual-iBoot-Fun/).
Serial output is simply printed to stdout right now.

## Screenshots

<img width="771" alt="Config" src="https://user-images.githubusercontent.com/1725664/124231369-04456000-dac5-11eb-895c-af933a08a5d7.png">

<img width="769" alt="Install" src="https://user-images.githubusercontent.com/1725664/124231322-f68fda80-dac4-11eb-91b8-e29301f50430.png">

<img width="767" alt="Run" src="https://user-images.githubusercontent.com/1725664/124231661-6dc56e80-dac5-11eb-9fea-b6bcd4fb5db6.png">

<img width="767" alt="Recovery" src="https://user-images.githubusercontent.com/703304/139936992-8e7d15a1-c79f-4c0d-a8f2-f82ec40d47ae.png">
