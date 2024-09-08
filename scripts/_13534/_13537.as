package _13534
{
   import _1404._1407;
   import _51._50;
   import _555.LibraryPanelController;
   import _703._702;
   import _724._13550;
   import _755._757;
   import _93._92;
   
   public class _13537 extends _92
   {
      public function _13537()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.setParent(this._13746);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3027(this._13745);
         this._2894();
      }
      
      override protected function _2211() : *
      {
         var _loc3_:Object = null;
         var _loc1_:Array = [];
         var _loc2_:Array = [];
         for each(_loc3_ in this._13747)
         {
            if(_loc3_ is _13550)
            {
               _loc1_.push(_loc3_._13695);
               _loc2_.push(_loc3_._13751);
            }
            else if(_loc3_ is _50)
            {
               _loc1_.push(_loc3_._13655);
               _loc2_.push(_loc3_.libraryParentType);
            }
         }
         return [_loc1_,_loc2_];
      }
      
      protected function setParent(param1:_13550) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         for each(_loc3_ in this._13747)
         {
            _loc2_ = param1 is _13550 ? _13550.LIBRARYVITUALFOLDERVO : _13550.LIBRARYVITUALFOLDERVO;
            this._13749(_loc3_,param1,_loc2_);
         }
      }
      
      protected function _3027(param1:Array) : void
      {
         var _loc2_:Array = param1[0];
         var _loc3_:Array = param1[1];
         var _loc4_:int = int(this._13747.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this._13749(this._13747[_loc5_],_loc2_[_loc5_],_loc3_[_loc5_]);
            _loc5_++;
         }
      }
      
      protected function _13749(param1:Object, param2:Object, param3:int) : void
      {
         var _loc4_:Object = null;
         var _loc5_:_702 = null;
         if(param1 is _13550)
         {
            param1._13695 = param2;
            param1._13751 = param3;
            _loc4_ = this._2861._3678._13739[param1];
         }
         else if(param1 is _50)
         {
            param1._13655 = param2;
            param1.libraryParentType = param3;
            _loc4_ = this._2861._3678._13748[param1];
         }
         if(param2 is _757)
         {
            _loc5_ = this._2861._3678;
         }
         else if(param2 is _13550)
         {
            _loc5_ = this._2861._3678._13739[param2];
         }
         if(Boolean(_loc4_) && Boolean(_loc5_))
         {
            _loc4_.parentNode = _loc5_;
         }
      }
      
      protected function _2894() : void
      {
         this._2861._2891();
      }
      
      protected function get _13750() : Array
      {
         return _2223.items;
      }
      
      protected function get _13747() : Array
      {
         return _2223.itemsVOList;
      }
      
      protected function get _13746() : _13550
      {
         return _2223._6074;
      }
      
      protected function get _13745() : Array
      {
         return _2208;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

