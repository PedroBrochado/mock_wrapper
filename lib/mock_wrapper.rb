class MockWrapper

  def initialize default_options = nil
    default_options = File.join(File.dirname(__FILE__), "..", "config", "default.yml") unless default_options
    default_options = YAML.load_file(default_options)
    @default_options = {}
    default_options.each{|key,value| @default_options[key.to_sym] = value}
  end

  def init
    cmd = "mock #{parse_options __method__, @default_options}--init"
    @cmd_output = execute cmd
  end

  def clean
    cmd = "mock #{parse_options __method__, @default_options}--clean"
    @cmd_output = execute cmd
  end

  def install package_list
    cmd = "mock #{parse_options __method__, @default_options}--install #{package_list}"
    @cmd_output = execute cmd
  end

  def remove package_list
    cmd = "mock #{parse_options __method__, @default_options}--remove #{package_list}"
    @cmd_output = execute cmd
  end

  def shell command
    cmd = "mock #{parse_options __method__, @default_options}--shell \"#{command}\""
    @cmd_output = execute cmd
  end

  def copy_in local_path, chroot_path
    cmd = "mock #{parse_options __method__, @default_options}--copyin \"#{local_path}\" \"#{chroot_path}\""
    @cmd_output = execute cmd
  end

  def copy_out chroot_path, local_path
    cmd = "mock #{parse_options __method__, @default_options}--copyout \"#{chroot_path}\" \"#{local_path}\""
    @cmd_output = execute cmd
  end

  def update_options options
    @default_options.merge!(options)
  end

  def remove_options options
    options.each{|key| @default_options.delete(key)}
  end

  def new_options options
    @default_options = options
  end

  def get_options
    return @default_options
  end

  class CommandExecuitonError < StandardError; end

  private
    def execute cmd
      @cmd_output = `#{cmd} 2>&1`
      return @cmd_output if $?.success?
      raise CommandExecuitonError, "Error running: \n\t'#{cmd}\n"
    end

    def parse_options cmd = nil, options
      return_str = ""
      return_str << "-v " if options[:verbose]
      return_str << "--trace " if options[:debug]
      return_str << "-q " if options[:quiet]
      return_str << "--offline " if options[:offline]
      return_str << "--configdir #{options[:configdir]} " if options[:configdir]
      return_str << "-r #{options[:root]} " if options[:root]
      return return_str
    end
end