;;
;; Copyright (C) 2009-2018, Intel Corporation
;; All rights reserved.
;; 
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions
;; are met:
;; 
;;   * Redistributions of source code must retain the above copyright
;;     notice, this list of conditions and the following disclaimer.
;;   * Redistributions in binary form must reproduce the above copyright
;;     notice, this list of conditions and the following disclaimer in
;;     the documentation and/or other materials provided with the
;;     distribution.
;;   * Neither the name of Intel Corporation nor the names of its
;;     contributors may be used to endorse or promote products derived
;;     from this software without specific prior written permission.
;; 
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;; HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
;; INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;; BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
;; OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
;; AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
;; WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.
;; 
;; *********************************************************************
;; 
;; PLEASE NOTE: This file is a downstream copy of a file maintained in
;; a repository at cilkplus.org. Changes made to this file that are not
;; submitted through the contribution process detailed at
;; http://www.cilkplus.org/submit-cilk-contribution will be lost the next
;; time that a new version is released. Changes only submitted to the
;; GNU compiler collection or posted to the git repository at
;; https://bitbucket.org/intelcilkruntime/intel-cilk-runtime are
;; not tracked.
;; 
;; We welcome your contributions to this open source project. Thank you
;; for your assistance in helping us improve Cilk Plus.
;;
;;*****************************************************************************
;;
;; safe_seh.asm
;;
;; This module declares our exception handlers "safe".  That is, they are in
;; the generated code and the exception dispatcher is sure that they weren't
;; injected by some virus which is trying to get control.  Chris Brumme's blog
;; discusses this briefly:
;; http://blogs.msdn.com/b/cbrumme/archive/2003/10/01/51524.aspx
;;
;; Failure to mark our exception handlers as safe will result in the exception
;; dispatcher skipping them.
;;
;; This only applies to the Win32 build

.386
.model  flat
IF _MSC_VER LT 1600
    __cilkrts_detach_handler    proto
    __cilkrts_stub_handler      proto
    .safeseh    __cilkrts_detach_handler
    .safeseh    __cilkrts_stub_handler
ELSE
    ___cilkrts_detach_handler    proto
    ___cilkrts_stub_handler      proto
    .safeseh    ___cilkrts_detach_handler
    .safeseh    ___cilkrts_stub_handler
ENDIF
end
