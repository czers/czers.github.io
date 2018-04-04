+++
publishdate = "2017-04-09"
lastmod = "2018-03-02"
title = "How to configure Azure firewall using CLI"
description = "Configuring Azure Network Security Groups using Azure CLI 2.0"
tags = ["azure", "streisand"]
categories = ["tech"]
draft = false
toc = true

+++

<br/>
**UPDATE 2018-03-02**: Streisand project now allows fully automatic creation of
VPN server instances. Hurray!

I've ran into some problems recently while trying to setup multiple instances
of [Streisand VPN][streisand]. It seems that on Microsoft Azure there's no easy
way to copy or export/import firewall (Network Security Group - NSG)
configuration between different virtual machines using Azure Portal.

Fortunately, Azure has [a CLI][azure-cli] (version 2.0 now) available which
can be used to setup network security groups in an automated fashion.

<!--more-->

# Choosing subscription to use with CLI

If you use Azure, chances are you have multiple subscriptions associated with
your account. With Azure CLI, you have to choose upfront which subscription will
be used for subsequent commands. To list subscriptions available in your account
use:

{{< highlight shell >}}
$ az account list --output table
{{< /highlight >}} 

This will produce output like this:

{{< highlight shell >}}
$ az account list --output table
Name                                  CloudName    SubscriptionId                        State    IsDefault
------------------------------------  -----------  ------------------------------------  -------  -----------
Visual Studio Professional with MSDN  AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled  True
Visual Studio Enterprise with MSDN    AzureCloud   XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  Enabled
{{< /highlight >}} 

To choose default subscription run:

{{< highlight shell >}}
$ az account set --subscription "Visual Studio Enterprise with MSDN"
{{< /highlight >}}

This won't produce any output, rerun `az account list --output table` and look
at `IsDefault` column if you want to make sure subscription context has been
changed successfully.

# Setting up Network Security Group rules

The following script sets up all the rules needed by the current (April 2017)
version of Streisand VPN. Assign VM's resource group name to `RG_NAME` and its security group name to `NSG_NAME`.

{{< highlight shell "linenos=table" >}}
{{< readFile "snippets/azure-firewall-cli-configuration/streisand.sh" >}}
{{< /highlight >}}

You can find all the code from this post in [this Gist][gist]. If you have any
comments, [About page]({{< ref "about.md" >}}) has some info on how to reach me.

If you like this post, [send me a postcard!]({{< ref "about.md#postcard" >}})

[streisand]: https://github.com/jlund/streisand
[azure-cli]: https://docs.microsoft.com/en-us/cli/azure/overview
[gist]: https://gist.github.com/czers/22b7aa45a0a256c1d93b63bb3c36ec22

