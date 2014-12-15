module SPTK

# Julia wrapper for Speech signal Processing Toolkit (SPTK).
#
# The original SPTK: http://sp-tk.sourceforge.net/
# Note that the SPTK.jl is based on the slightly modified SPTK
# https://github.com/r9y9/SPTK

export
    # (Mel-) Cepstrum related analysis
    mcep,
    gcep,
    mgcep,
    uels,
    fftcep,
    mfcc,

    # Conversions
    mgc2b,
    mc2b,
    b2mc,
    c2ir,
    gc2gc,
    gnorm,
    ignorm,
    freqt,
    mgc2mgc,

    # F0 estimation
    swipe,

    # Waveform generation filters
    mlsadf,
    mglsadf,

    # Waveform generation filters (more convenient types and methods)
    MLSADF,
    MGLSADF,
    filter!,
    synthesis_one_frame!,
    synthesis!

deps = joinpath(Pkg.dir("SPTK"), "deps", "deps.jl")
if isfile(deps)
    include(deps)
else
    error("SPTK not properly installed. Please run Pkg.build(\"SPTK\")")
end

for fname in ["bridge",
              "mgc2b",
              "waveform_generation"]
    include(string(fname, ".jl"))
end

end # module SPTK
