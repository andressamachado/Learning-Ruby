module Complement 
    DNA_TO_RNA = {"G" => "C", "C" => "G", "T" => "A", "A" => "U", "U" => "A"}
    
    def self.of_dna(input)
      dna_strand = input.split('')
      rna_strand = dna_strand.map { |dna| DNA_TO_RNA[dna] }
      
      rna_strand.join
    end
end
