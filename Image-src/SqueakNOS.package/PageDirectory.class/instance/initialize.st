initialize-release
initialize 
	super initialize.
	"self entries withIndexDo: [:entry :index | entry clean. entry setPresentAndSupervisor]"