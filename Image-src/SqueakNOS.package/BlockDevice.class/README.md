A BlockDevice is an <<abstract class>> that represents a device that is accessed by block index. Maybe it should subclass ArrayedCollection and not Object. It implements a veeeeery primitive caching mechanism.

ATADevice is an example of a block device.