# motion-list

This is RubyMotion plugin which provides various lists.

## Install

```
$ gem install motion-list
```

If you like to install manually,

```
$ git clone https://github.com/Watson1978/motion-list.git
$ cd motion-list
$ rake install
```

## Usage

### codesigning

`list codesigning` command shows the list of your codesigning from Keychain.

```
$ motion list codesigning
  1) XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "iPhone Distribution: Shizuo Fujita (KQ572MNR73)"
  2) XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "Developer ID Application: Shizuo Fujita (KQ572MNR73)"
  3) XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "3rd Party Mac Developer Application: Shizuo Fujita (KQ572MNR73)"
  4) XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "iPhone Developer: Shizuo Fujita (4A73CV3K9R)"
     4 valid identities found
```

You can configure about codesigning in your RubyMotion project, like

```ruby
Motion::Project::App.setup do |app|
  ...
  app.codesign_certificate = "iPhone Developer: Shizuo Fujita (4A73CV3K9R)"
end

### simulator

`list codesigning` command shows the list of simulator device types which you can use.

```
$ motion list simulator
== Device Types ==
iPhone 4s (com.apple.CoreSimulator.SimDeviceType.iPhone-4s)
iPhone 5 (com.apple.CoreSimulator.SimDeviceType.iPhone-5)
iPhone 5s (com.apple.CoreSimulator.SimDeviceType.iPhone-5s)
iPhone 6 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus)
iPhone 6 (com.apple.CoreSimulator.SimDeviceType.iPhone-6)
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
Resizable iPhone (com.apple.CoreSimulator.SimDeviceType.Resizable-iPhone)
Resizable iPad (com.apple.CoreSimulator.SimDeviceType.Resizable-iPad)
== Runtimes ==
iOS 7.1 (7.1 - 11D167) (com.apple.CoreSimulator.SimRuntime.iOS-7-1)
iOS 8.1 (8.1 - 12B411) (com.apple.CoreSimulator.SimRuntime.iOS-8-1)
iOS 8.2 (8.2 - 12D508) (com.apple.CoreSimulator.SimRuntime.iOS-8-2)
iOS 8.3 (8.3 - 12F69) (com.apple.CoreSimulator.SimRuntime.iOS-8-3)
== Devices ==

...
```

You can use specific simulator device with `device_name` environment variable when you run `rake`.

```
$ rake device_name='iPhone 4s'
$ rake device_name='iPhone 5' target=7.1 # Launch iOS 7.1 simulator with iPhone 5 device
```
