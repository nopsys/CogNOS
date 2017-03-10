Only "working" for PCI, however, we use 16 bits mode so it's more compatible with older ISA cards, try with:

LancePCIDevice installOn: Computer current.
Computer current defaultNetworkInterface macAddress hex.

Information from:

GRUB Legacy's source in netboot/lance.c netboot/pci.c and netboot/config.c
(from this sources, we are assuming PCI, and with that ENABLE_AUTOSELECT and no MUST_UNREST)

Am79C972
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/21485_pt1.pdf
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/21485_pt2.pdf
Specially pages starting at: 91 of part 1

Am79C970
http://www.amd.com/files/connectivitysolutions/networking/archivednetworking/19436.pdf

More Tech Info from AMD:
http://www.amd.com/us-en/ConnectivitySolutions/DesignWithAMD (Networking Tech Docs, Archived Tech Docs)