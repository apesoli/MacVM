# MacVM

macOS Monterey added support for virtualizing macOS with Apple silicon host.

This project provides an example project for the setup.

## Update for recovery boot options

Full credits to Khaos Tian, fantastic work. I've only put things together
(in a very hacky way).

https://gist.github.com/KhaosT/8167170d1452daec1ba292e37e5768c8

My Swift-fu is non-existent, and my Objective-C is rusty. I've added an "R"
button next to the play button on the top right corner that will boot your VM
in Recovery Mode.

This is super convenient if you need to test things with SIP/AMFI disabled, or if
you need to do kernel debugging. Although kernel debugging on M1 appears to be still
at the point where you can only inspect current state.

<img width="771" alt="Config" src="https://user-images.githubusercontent.com/1725664/124231369-04456000-dac5-11eb-895c-af933a08a5d7.png">

<img width="769" alt="Install" src="https://user-images.githubusercontent.com/1725664/124231322-f68fda80-dac4-11eb-91b8-e29301f50430.png">

<img width="767" alt="Run" src="https://user-images.githubusercontent.com/1725664/124231661-6dc56e80-dac5-11eb-9fea-b6bcd4fb5db6.png">

<img width="767" alt="Recovery" src="https://user-images.githubusercontent.com/703304/139936992-8e7d15a1-c79f-4c0d-a8f2-f82ec40d47ae.png">
