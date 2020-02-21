-- 
-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
-- 
--    http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 


local lu = require('luaunit')
local SegmentRef = require('segment_ref')

TestSegmentRef = {}
    -- This test is originally from ContextCarrierV2HeaderTest in the Java agent.
    function TestSegmentRef:testFromSW6Value()
        local ref = SegmentRef:new():fromSW6Value('1-My40LjU=-MS4yLjM=-4-1-1-IzEyNy4wLjAuMTo4MDgw-Iy9wb3J0YWw=-MTIz')
        lu.assertNotNil(ref)
        lu.assertEquals(ref.trace_id, {3, 4, 5})
        lu.assertEquals(ref.segment_id, {1, 2, 3})
        lu.assertEquals(ref.span_id, 4)
        lu.assertEquals(ref.parent_service_instance_id, 1)
        lu.assertEquals(ref.entry_service_instance_id, 1)
        lu.assertEquals(ref.network_address, '127.0.0.1:8080')
        lu.assertEquals(ref.network_address_id, nil)
        lu.assertEquals(ref.entry_endpoint_name, '/portal')
        lu.assertEquals(ref.entry_endpoint_id, nil)
        lu.assertEquals(ref.parent_endpoint_name, nil)
        lu.assertEquals(ref.parent_endpoint_id, 123)

        ref = SegmentRef:new():fromSW6Value('1-My40LjU=-MS')
        lu.assertNil(ref)
    end
-- end TestSegmentRef


os.exit( lu.LuaUnit.run() )