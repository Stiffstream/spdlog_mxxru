#include <iostream>
#include "spdlog/spdlog.h"

int main(int, char* [])
{
    namespace spd = spdlog;
    try
    {
        // console logger (multithreaded and with color)
        auto console = spd::stdout_logger_mt("console", true);
        console->info("Welcome to spdlog!") ;
        console->info("An info message example {}..", 1);

        //Formatting examples
        console->info("Easy padding in numbers like {:08d}", 12);
        console->info("Support for int: {0:d};  hex: {0:x};  oct: {0:o}; bin: {0:b}", 42);
        console->info("Support for floats {:03.2f}", 1.23456);
        console->info("Positional args are {1} {0}..", "too", "supported");

        console->info("{:<30}", "left aligned");
        console->info("{:>30}", "right aligned");
        console->info("{:^30}", "centered");

        //
        // Runtime log levels
        //
        spd::set_level(spd::level::info); //Set global log level to info
        console->debug("This message shold not be displayed!");
        console->set_level(spd::level::debug); // Set specific logger's log level
        console->debug("Now it should..");

        //
        // Create a basic multithreaded file logger (or "basic_logger_st" for single threaded logger)
        //
        auto my_logger = spd::basic_logger_mt("basic_logger", "logs/basic.txt");
        my_logger->info("Some log message");

        //
        // Create a file rotating logger with 5mb size max and 3 rotated files
        //
        auto rotating_logger = spd::rotating_logger_mt("some_logger_name", "logs/mylogfile", 1048576 * 5, 3);
        for(int i = 0; i < 10; ++i)
              rotating_logger->info("{} * {} equals {:>10}", i, i, i*i);

        //
        // Create a daily logger - a new file is created every day on 2:30am
        //
        auto daily_logger = spd::daily_logger_mt("daily_logger", "logs/daily", 2, 30);

        //
        // Customize msg format for all messages
        //
        spd::set_pattern("*** [%H:%M:%S %z] [thread %t] %v ***");
        rotating_logger->info("This is another message with custom format");

        spd::get("console")->info("loggers can be retrieved from a global registry using the spdlog::get(logger_name) function");

        //
        // Compile time debug or trace macros.
        // Enabled #ifdef SPDLOG_DEBUG_ON or #ifdef SPDLOG_TRACE_ON
        //
        SPDLOG_TRACE(console, "Enabled only #ifdef SPDLOG_TRACE_ON..{} ,{}", 1, 3.23);
        SPDLOG_DEBUG(console, "Enabled only #ifdef SPDLOG_DEBUG_ON.. {} ,{}", 1, 3.23);

        //
        // Asynchronous logging is very fast..
        // Just call spdlog::set_async_mode(q_size) and all created loggers from now on will be asynchronous..
        //
        size_t q_size = 8192; //queue size must be power of 2
        spdlog::set_async_mode(q_size);
        auto async_file= spd::daily_logger_st("async_file_logger", "logs/async_log.txt");
        async_file->info("This is async log..Should be very fast!");

        //
        // syslog example. linux only..
        //
        #ifdef __linux__
        std::string ident = "spdlog-example";
        auto syslog_logger = spd::syslog_logger("syslog", ident, LOG_PID);
        syslog_logger->warn("This is warning that will end up in syslog. This is Linux only!");
        #endif

    }
    catch (const spd::spdlog_ex& ex)
    {
        std::cout << "Log failed: " << ex.what() << std::endl;
    }
}
