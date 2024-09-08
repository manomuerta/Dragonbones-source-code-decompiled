package _537
{
   import _13505._13504;
   import _13505._13508;
   import _13505._13510;
   import _51._79;
   import _783.TimelineNotification;
   import _93._94;
   
   public class _13541 extends _94
   {
      protected var _3783:_13510;
      
      protected var _3780:Vector.<_13510>;
      
      public function _13541()
      {
         super();
         this._3780 = new Vector.<_13510>();
      }
      
      public function get _3053() : _13510
      {
         return this._3783;
      }
      
      public function set _3053(param1:_13510) : void
      {
         if(this._3783 != param1)
         {
            this._3783 = param1;
            this._3777(this._3783);
         }
      }
      
      public function get _2889() : Vector.<_13510>
      {
         return this._3780;
      }
      
      public function isSelected(param1:_13510) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return this._3780.indexOf(param1) != -1;
      }
      
      public function _3024() : void
      {
         if(this._3780.length > 0)
         {
            this._6122();
            this._3778();
         }
      }
      
      public function _2986(param1:Vector.<_13510>, param2:_13510 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null && param2 == null && this._3780.length == 0)
         {
            return;
         }
         if(Boolean(param2) && this._3780.length == 1)
         {
            if(this._3780[0] == param2)
            {
               return;
            }
         }
         this._6122();
         if(param2)
         {
            param2.selected = true;
            this._3780.push(param2);
         }
         else if(param1)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               param1[_loc3_].selected = true;
               this._3780.push(param1[_loc3_]);
               _loc3_++;
            }
         }
         this._3778();
      }
      
      public function _3877(param1:Vector.<_13510>, param2:_13510 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(this._3780.indexOf(param2) == -1)
            {
               param2.selected = true;
               this._3780.push(param2);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(this._3780.indexOf(param1[_loc4_]) == -1)
               {
                  param1[_loc4_].selected = true;
                  this._3780.push(param1[_loc4_]);
                  _loc3_ = true;
               }
               _loc4_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3876(param1:Vector.<_13510>, param2:_13510 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2)
         {
            _loc4_ = int(this._3780.indexOf(param2));
            if(_loc4_ != -1)
            {
               param2.selected = false;
               this._3780.splice(_loc4_,1);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = int(this._3780.indexOf(param1[_loc5_]));
               if(_loc4_ != -1)
               {
                  param1[_loc5_].selected = false;
                  this._3780.splice(_loc4_,1);
                  _loc3_ = true;
               }
               _loc5_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3874(param1:Vector.<_13510>, param2:_13510 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(!this.isSelected(param2))
            {
               this._3877(null,param2);
            }
         }
         else if(param1)
         {
            _loc3_ = false;
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(!this.isSelected(param1[_loc4_]))
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_)
            {
               this._3877(param1,param2);
            }
            else if(param1.length != this._3780.length)
            {
               this._3875(param1,param2);
            }
         }
      }
      
      public function _3875(param1:Vector.<_13510>, param2:_13510 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = int(this._3780.indexOf(param2));
            if(_loc3_ != -1)
            {
               param2.selected = false;
               this._3780.splice(_loc3_,1);
            }
            else
            {
               param2.selected = true;
               this._3780.push(param2);
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = int(this._3780.indexOf(param1[_loc4_]));
               if(_loc3_ != -1)
               {
                  param1[_loc4_].selected = false;
                  this._3780.splice(_loc3_,1);
               }
               else
               {
                  param1[_loc4_].selected = true;
                  this._3780.push(param1[_loc4_]);
               }
               _loc4_++;
            }
         }
         this._3778();
      }
      
      private function _6122() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3780.length);
         while(_loc1_ < _loc2_)
         {
            this._3780[_loc1_].selected = false;
            _loc1_++;
         }
         this._3780.length = 0;
      }
      
      protected function _3777(param1:_13510) : void
      {
      }
      
      protected function _3778() : void
      {
         _1567(new TimelineNotification(TimelineNotification.UPDATE_SELECT_TIMELINES));
      }
      
      public function _13777() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._3780.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3780[_loc2_] is _13504)
            {
               _loc1_.push((this._3780[_loc2_] as _13504)._1823);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _14531(param1:_79, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this._3780.length);
         while(_loc3_ < _loc4_)
         {
            if(this._3780[_loc3_].flag == param2)
            {
               if(this._3780[_loc3_] is _13508 && (this._3780[_loc3_] as _13508)._1824 == param1 || this._3780[_loc3_].parent is _13508 && (this._3780[_loc3_].parent as _13508)._1824 == param1)
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
   }
}

