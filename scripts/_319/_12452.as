package _319
{
   import _18.IAction;
   
   public class _12452 extends _328
   {
      public function _12452()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(vertices.length);
         while(_loc1_ < _loc2_)
         {
            mesh._12550(vertices[_loc1_],this._3192[_loc1_],this._3191[_loc1_]);
            _loc1_++;
         }
         vertex.update();
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.revert();
         _loc1_ = 0;
         _loc2_ = int(vertices.length);
         while(_loc1_ < _loc2_)
         {
            mesh._12550(vertices[_loc1_],this._3147[_loc1_],this._3146[_loc1_]);
            _loc1_++;
         }
         vertex.update();
         this._2894();
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_12452 = param1 as _12452;
         if(_loc2_)
         {
            _2223._3192 = _loc2_._3192;
            _2223._3191 = _loc2_._3191;
            return true;
         }
         return false;
      }
      
      override protected function _2894() : void
      {
         super._2894();
      }
      
      private function get _3192() : Array
      {
         return _2223._3192;
      }
      
      private function get _3191() : Array
      {
         return _2223._3191;
      }
      
      private function get _3147() : Array
      {
         return _2223._3147;
      }
      
      private function get _3146() : Array
      {
         return _2223._3146;
      }
   }
}

