#ifndef __PORT_COUNTERS__
#define __PORT_COUNTERS__

#include "headers.p4"

#define MAX_PORTS 100

control port_counters_ingress(inout headers_t hdr,
                              inout standard_metadata_t standard_metadata) {

    counter(MAX_PORTS, CounterType.packets_and_bytes) ingress_port_counter;

    apply {
        ingress_port_counter.count((bit<32>) standard_metadata.ingress_port);
    }
}

control port_counters_egress(inout headers_t hdr,
                             inout standard_metadata_t standard_metadata) {

    counter(MAX_PORTS, CounterType.packets_and_bytes) egress_port_counter;

    apply {
        egress_port_counter.count((bit<32>) standard_metadata.egress_port);
    }
}

#endif