package _333
{
   import _1404._1407;
   import _51._52;
   import _51._79;
   import _555._570;
   import _586._594;
   import _658.Mesh;
   import _658._660;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _334 extends _92
   {
      public function _334()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(this.meshRig)
         {
            _2223.oldWeights = this.meshRig._3202();
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         _2223._3200 = this.meshRig._2970(this._1836);
         _2223.boneIndex = this.meshRig._2922.indexOf(this._1836);
         this.meshRig._2892(this._1836);
         if(this.meshRig._2922.length == 0)
         {
            this.mesh.meshRig = null;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this.meshRig._3203(this._1836,this._3200,_2223.boneIndex);
         if(_2223.oldWeights)
         {
            this.meshRig._3201(_2223.oldWeights);
         }
         if(this.mesh.meshRig == null)
         {
            this.mesh.meshRig = this.meshRig;
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._2853.refresh();
         this._3008._3199();
      }
      
      private function get meshRig() : _660
      {
         return _2223.meshRig as _660;
      }
      
      private function get _1836() : _52
      {
         return _2223._1836 as _52;
      }
      
      private function get mesh() : Mesh
      {
         return _2223.mesh as Mesh;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get _3200() : Matrix
      {
         return _2223._3200 as Matrix;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}

