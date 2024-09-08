package _333
{
   import _1404._1407;
   import _18.IAction;
   import _51._52;
   import _51._79;
   import _555._570;
   import _658.Mesh;
   import _658._660;
   import _658._662;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _335 extends _92
   {
      public function _335()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         if(param1 is _335)
         {
            _2223._2991 = param1._1642._2991;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3204(_2223._2991);
         this._2894();
      }
      
      public function _3204(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc5_:Number = NaN;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_].bone;
            _loc5_ = Number(param1[_loc2_].weight);
            this._3205._3206(_loc4_,_loc5_,this.meshRig._2970(_loc4_));
            _loc2_++;
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3204(_2223._2992);
         this._2894();
      }
      
      public function _2894() : void
      {
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._2853.refresh();
      }
      
      private function get _3205() : _662
      {
         return _2223._3205 as _662;
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
   }
}

