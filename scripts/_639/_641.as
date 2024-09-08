package _639
{
   import _636.DBModelEvent;
   import _708._714;
   import _708._715;
   import _764.LayoutTemplate;
   import _97._116;
   import flash.utils.Dictionary;
   
   public class _641 extends _640
   {
      private var _5641:_715;
      
      private var _5639:_714;
      
      private var _5640:Dictionary;
      
      public function _641()
      {
         this._5641 = _715.NULL;
         this._5639 = _714.STOP;
         this._5640 = new Dictionary();
         super();
         _5633 = "layout.amf";
         _5627 = "layoutDebug.amf";
      }
      
      public function _1664(param1:Boolean = false) : void
      {
         var _loc2_:_715 = null;
         for each(_loc2_ in _715.List)
         {
            this._5638(_loc2_.toString(),param1);
            this._5638(_loc2_.toString() + "OpenPanelPosition",param1);
         }
      }
      
      private function _5638(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:XML = null;
         var _loc3_:Object = _5629(param1);
         if(Boolean(_loc3_) && !param2)
         {
            _loc4_ = new XML(_loc3_);
            if(this._2984(_loc4_))
            {
               this._5640[param1] = (LayoutTemplate._5637[param1] as XML).copy();
            }
            else
            {
               this._5640[param1] = _loc4_;
            }
         }
         else
         {
            this._5640[param1] = (LayoutTemplate._5637[param1] as XML).copy();
         }
      }
      
      private function _10792(param1:String, param2:XML) : XML
      {
         if(param1 == _715.COMIC.toString() || param1 == _715.COMIC.toString() + "OpenPanelPosition" || param2 == null)
         {
            return param2;
         }
         return this._10794(param2);
      }
      
      private function _2984(param1:XML) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc4_:XML = null;
         var _loc3_:XMLList = param1.children();
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return false;
         }
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.@content == "TransformPanel")
            {
               return true;
            }
            _loc2_ ||= this._2984(_loc4_);
         }
         return _loc2_;
      }
      
      private function _10794(param1:XML) : XML
      {
         var _loc2_:XMLList = param1.children();
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return param1;
         }
         return this._10795(param1);
      }
      
      public function _10795(param1:XML) : XML
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc2_:* = "";
         _loc2_ += "<" + param1.localName();
         for each(_loc3_ in param1.attributes())
         {
            _loc2_ += " " + _loc3_.localName() + "=\"" + _loc3_.toString() + "\"";
         }
         _loc2_ += ">";
         for each(_loc4_ in param1.children())
         {
            _loc2_ += this._10793(_loc4_);
         }
         _loc2_ += "</" + param1.localName() + "/>";
         return new XML(_loc2_);
      }
      
      private function _10793(param1:XML) : String
      {
         var _loc3_:XML = null;
         var _loc4_:XMLList = null;
         var _loc5_:Boolean = false;
         var _loc6_:XML = null;
         var _loc2_:* = "";
         _loc2_ += "<" + param1.localName();
         for each(_loc3_ in param1.attributes())
         {
            _loc2_ += " " + _loc3_.localName() + "=\"" + _loc3_.toString() + "\"";
         }
         _loc2_ += ">";
         _loc4_ = param1.children();
         if(_loc4_ == null || _loc4_.length == 0)
         {
            return _loc6_.toXMLString();
         }
         for each(_loc6_ in _loc4_)
         {
            if(_loc6_.@content == "TransformPanel")
            {
               _loc5_ = true;
            }
         }
         if(!_loc5_)
         {
            for each(_loc6_ in _loc4_)
            {
               _loc2_ += this._10793(_loc6_);
            }
            return _loc2_ + ("</" + param1.localName() + "/>");
         }
         return "";
      }
      
      public function _4804() : void
      {
         var _loc1_:String = this._5641.toString();
         _5621(_loc1_,this._5640[_loc1_],true);
      }
      
      public function _4803() : void
      {
         var _loc1_:* = this._5641.toString() + "OpenPanelPosition";
         _5621(_loc1_,this._5640[_loc1_]);
      }
      
      public function _4802(param1:String, param2:Boolean = true) : XML
      {
         var _loc4_:XML = null;
         if(!_116.getInstance(param1))
         {
            return null;
         }
         var _loc3_:XML = this._5640[this._2873.toString() + "OpenPanelPosition"];
         if(_loc3_.child(param1).length() == 0)
         {
            if(!param2)
            {
               return null;
            }
            _loc4_ = new XML("<" + param1 + "/>");
            _loc3_.appendChild(new XML("<" + param1 + "/>"));
         }
         return _loc3_.child(param1)[0];
      }
      
      public function _4826(param1:String) : Boolean
      {
         var _loc2_:String = this._4821.toXMLString();
         var _loc3_:String = param1;
         if(_loc2_.indexOf(_loc3_) > -1)
         {
            return true;
         }
         return false;
      }
      
      public function _12697(param1:_715) : XML
      {
         return this._5640[param1.toString()];
      }
      
      public function get _4821() : XML
      {
         return this._12697(this._2873);
      }
      
      public function set _4821(param1:XML) : void
      {
         this._5640[this._2873.toString()] = param1;
         var _loc2_:String = this._2873.toString();
         _5621(_loc2_,this._5640[_loc2_],true);
      }
      
      public function get _4805() : XML
      {
         return this._5640[this._2873.toString() + "OpenPanelPosition"];
      }
      
      public function get _2873() : _715
      {
         return this._5641;
      }
      
      public function set _2873(param1:_715) : void
      {
         if(this._5641 == param1)
         {
            return;
         }
         this._5641 = param1;
         dispatchEvent(new DBModelEvent(DBModelEvent.EDIT_MODE_CHANGED));
      }
      
      public function get _4000() : _714
      {
         return this._5639;
      }
      
      public function set _4000(param1:_714) : void
      {
         if(this._5639 == param1)
         {
            return;
         }
         this._5639 = param1;
         dispatchEvent(new DBModelEvent(DBModelEvent.ANIMATION_MODE_CHANGED));
      }
   }
}

