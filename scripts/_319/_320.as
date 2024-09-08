package _319
{
   import _658._661;
   
   public class _320 extends _328
   {
      public function _320()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         super._2211();
      }
      
      override public function execute() : void
      {
         var _loc1_:Vector.<_661> = null;
         super.execute();
         mesh._3167(vertex,this._3169,false);
         _loc1_ = _2223.edge as Vector.<_661>;
         var _loc2_:_661 = vertex;
         if(_loc1_ != null && _loc1_.length == 2 && _loc1_[0] != null)
         {
            mesh._3160(_loc1_[0],_loc1_[1],false);
            mesh._3166(_loc1_[0],vertex,false);
            mesh._3166(vertex,_loc1_[1],false);
            _loc2_ = null;
         }
         else if(this._3174)
         {
            mesh._3166(this._3174,vertex,false);
         }
         _3172._3170(this._3174,_loc2_);
         _11553._3170(this._3174,_loc2_);
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:Vector.<_661> = null;
         super.revert();
         mesh._3161(vertex,this._3169,false);
         _loc1_ = _2223.edge as Vector.<_661>;
         if(_loc1_ != null && _loc1_.length == 2 && _loc1_[0] != null)
         {
            mesh._3160(_loc1_[0],vertex,false);
            mesh._3160(vertex,_loc1_[1],false);
            mesh._3166(_loc1_[0],_loc1_[1],false);
         }
         else if(this._3174)
         {
            mesh._3160(this._3174,vertex,false);
         }
         _3172._3171();
         _11553._3171();
         this._2894();
      }
      
      private function get _3169() : _661
      {
         return _2223._3169 as _661;
      }
      
      private function get _3174() : _661
      {
         return _2223._3174 as _661;
      }
      
      override protected function _2894() : void
      {
         _3172._3173();
         _11553._3173();
         _2853.refresh();
      }
   }
}

