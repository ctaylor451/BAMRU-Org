require_relative "../base"
require_relative "../rake/loggers"
require_relative "./client"
require_relative "./log"


class Gcal
  class Sync

    extend Rake::Loggers
    include Gcal::Log

    # ----- sync everything -----

    def sync
      log_header
      delete_events(pending_delete)
      create_events(pending_create)
    end

    # ----- delete everything -----

    def delete_all
      log_header
      delete_events(GCAL_STORE.all.keys)
    end

    private

    # ----- support methods -----
    def client
      @gcal_client ||= ::Gcal::Client.new
    end

    # ----- list of events to be created/deleted -----

    def pending_create
      @pending_create ||= (BNET_STORE.calendar_events.keys - GCAL_STORE.all.keys)
    end

    def pending_delete
      @pending_delete ||= (GCAL_STORE.all.keys - BNET_STORE.calendar_events.keys)
    end

    # ------ create and delete individual events -----

    def create(event)
      client.create_event(event) unless READONLY
    end

    def delete(id,event)
      client.delete_event(id,event) unless READONLY
    end

    # ----- create / delete pending items -----

    def create_events(event_keys)
      num_events = 0
      event_keys.each do |event_key|
        print '.'.green unless VERBOSE
        error = create(BNET_STORE.all[event_key])
        num_events += 1 unless error
      end
      puts ' ' unless event_keys.length == 0 || VERBOSE
      log "Add GCal events: Created #{num_events} events"
    end

    def delete_events(event_keys)
      num_events = 0
      event_keys.each do |evid|
        print '.'.green unless VERBOSE
        error = delete(GCAL_STORE.all[evid].gcal_id, GCAL_STORE.all[evid])
        num_events += 1 unless error
      end
      puts ' ' unless event_keys.length == 0 || VERBOSE
      log "Remove GCal events: Removed #{num_events} events"
    end
  end
end
